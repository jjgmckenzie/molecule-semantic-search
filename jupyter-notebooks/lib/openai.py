import openai

load_dotenv()

openai.api_key = os.getenv('OPENAI_API_TOKEN')

def gpt4(prompt):
	completion = openai.ChatCompletion.create(
		model="gpt-4",
    temperature=0.0,
		messages=[
      {"role": "system", "content": "You are a helpful assistant."},
      {"role": "user", "content": f"{prompt}"}
		]
	)

	return completion.choices[0].message.content