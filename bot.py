import asyncio
import logging
from aiogram import Bot, Dispatcher, types
from aiogram.filters.command import Command
from aiogram.utils.keyboard import InlineKeyboardBuilder
from openai import OpenAI
import time
import requests, json

url = "https://api.openai.com/v1/chat/completions"

headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer"
}

base_body = {
    "model": "gpt-3.5-turbo",
    "messages": [
	    {
		    "role":"user",
		    "content":""
	    }
    ]
}

ASSISTANT_ID = "asst_QVOmjE2bUjlHDzBwaHDWu4On"

# Make sure your API key is set as an environment variable.
client = OpenAI(api_key="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")

# Включаем логирование, чтобы не пропустить важные сообщения
logging.basicConfig(level=logging.INFO)
# Объект бота
bot = Bot(token="6744075200:AAGM5-hQCxt5uDg0VAZy6xthbmNPiNtiw1g")
# Диспетчер
dp = Dispatcher()


# Хэндлер на команду /start
@dp.message(Command("start"))
async def cmd_start(message: types.Message):
	builder = InlineKeyboardBuilder()
	builder.row(
		types.InlineKeyboardButton(
			text="Живой Менеджер", url="https://t.me/nogaibayev_n"
		)
	)
	await message.answer("Добрый день! Я ваш виртуальный ассистент для предоставления информации "
	                     "и консультации по продуктам страхования жизни компании Halyk-Life. Если вас интересует конкретная информация по страхованию жизни, условиям полисов или процедурам страхования, пожалуйста, задайте мне вопрос! ",
	                     reply_markup=builder.as_markup())


@dp.message(Command("test1"))
async def cmd_test1(message: types.Message):
	await message.reply("Test 1")


@dp.message()
async def handle_text(message: types.Message):
	text = message.text

	thread = client.beta.threads.create(
		messages=[
			{
				"role": "user",
				# Update this with the query you want to use.
				"content": text,
			}
		]
	)

	run = client.beta.threads.runs.create(thread_id=thread.id, assistant_id=ASSISTANT_ID)

	while run.status != "completed":
		run = client.beta.threads.runs.retrieve(thread_id=thread.id, run_id=run.id)
		print(f"🏃 Run Status: {run.status}")
		time.sleep(1)
	else:
		print(f"🏁 Run Completed!")

	# Get the latest message from the thread.
	message_response = client.beta.threads.messages.list(thread_id=thread.id)
	messages = message_response.data

	# Print the latest message.
	latest_message = messages[0]
	await bot.send_message(chat_id=message.chat.id, text=f" {latest_message.content[0].text.value}")


if __name__ == "__main__":
	loop = asyncio.get_event_loop()
	loop.create_task(dp.start_polling(bot, skip_updates=True))
	loop.run_forever()
