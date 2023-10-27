
from transformers import AutoTokenizer, AutoModelWithLMHead

tokenizer = AutoTokenizer.from_pretrained('macedonizer/hr-gpt2')
model = AutoModelWithLMHead.from_pretrained('macedonizer/hr-gpt2')

tokenizer.save_pretrained('./macedonizer/hr-gpt2')
model.save_pretrained('./macedonizer/hr-gpt2')
