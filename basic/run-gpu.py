
import torch

print('Is cuda available?', torch.cuda.is_available())
print('Device count', torch.cuda.device_count())
print('Current device', torch.cuda.current_device())
print('Device name', torch.cuda.get_device_name(0))
