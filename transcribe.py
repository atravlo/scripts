from faster_whisper import WhisperModel

model = WhisperModel('large-v2')

segments, info = model.transcribe('/home/artem/Downloads/veins', language='en')

with open('veins.srt', 'w') as f:
    for i, seg in enumerate(segments, 1):
        start = seg.start
        end = seg.end
        f.write(f'{i}\n{int(start//3600):02}:{int((start%3600)//60):02}:{start%60:06.3f} --> {int(end//3600):02}:{int((end%3600)//60):02}:{end%60:06.3f}\n{seg.text.strip()}\n\n')

print('Done veins.srt')

