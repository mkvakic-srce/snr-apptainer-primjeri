
import random
import textwrap

from transformers import AutoTokenizer, AutoModelWithLMHead

# load
tokenizer = AutoTokenizer.from_pretrained('./macedonizer/hr-gpt2')
model = AutoModelWithLMHead.from_pretrained('./macedonizer/hr-gpt2')
model.to('cuda')

# generiraj
input_text = 'Od sutra ću'

encoded_input = tokenizer(input_text,
                          return_tensors="pt")
encoded_input = encoded_input.to('cuda')

output = model.generate(**encoded_input,
                        bos_token_id=random.randint(1, 50000),
                        do_sample=True,
                        top_k=50,
                        max_length=100,
                        top_p=0.95)

decoded_output = tokenizer.decode(output[0],
                                  skip_special_tokens=True)

# print
print('------ Input ------')
print(input_text,
      '...')

print('------ Output ------')
print("\n".join(textwrap.wrap(decoded_output,
                              width=80)),
      '...')
