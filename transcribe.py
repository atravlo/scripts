from faster_whisper import WhisperModel
from tqdm import tqdm

model_path = "/home/artem/.cache/huggingface/hub/models--Systran--faster-whisper-large-v2/snapshots/main/"

print("Loading model...")
model = WhisperModel(model_path)
print("Model loaded!")

print("Starting transcription...")
segments, info = model.transcribe('/home/artem/Downloads/veins', language='en')
duration = info.duration
print(f"Audio duration: {duration:.1f}s")

with open('veins.srt', 'w') as f, tqdm(total=duration, unit='s', desc='Transcribing', bar_format='{l_bar}{bar}| {n:.0f}/{total:.0f}s [{elapsed}<{remaining}]') as pbar:
    for i, seg in enumerate(segments, 1):
        start = seg.start
        end = seg.end
        f.write(f'{i}\n{int(start//3600):02}:{int((start%3600)//60):02}:{start%60:06.3f} --> {int(end//3600):02}:{int((end%3600)//60):02}:{end%60:06.3f}\n{seg.text.strip()}\n\n')
        pbar.update(end - start)

print('Done → veins.srt')
