typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { unsigned char pad[0x19]; unsigned char mode; unsigned char pad1[6]; u32 start, end, base; } Info;
typedef struct { u32 pos; short sequence; unsigned char pad[6]; u32 offset; u16 sample; unsigned char tail[14]; } Stream;
typedef struct { unsigned char pad[0x60]; int handles[2]; u32 base, stereo, limit; Info *info; Stream *streams; unsigned char pad7c[0x34]; u16 flags, samples; unsigned char padb4[4]; u16 channels; unsigned char padba[4]; unsigned char stride; } Obj;
extern int func_01ff8000(int *pos, int offset, void *buf, int count);
extern void func_020945f4(void *dst, int value, u32 count);
int func_0203af58(Obj *self, char **buffers, int index) {
    int i = 0;
    Stream *base = &self->streams[index];
    int samples = self->samples;
    u32 stride = self->stride;
    int done;
    Stream *stream = base;
    int total = 0;
    int *handle = &self->handles[index];
    do {
        u32 offset = stream->offset;
        done = stream->sample;
        if (done < samples) {
            int last = 0;
            int count = samples - done;
            char *dest;
            u32 source;
            int bytes;
            if (offset + count >= self->limit) {
                last = 1;
                count = self->limit - offset;
            }
            dest = buffers[i] + done * stride;
            bytes = count * stride;
            source = self->info->base + self->base + offset * stride;
            if (i != 0) source += self->stereo;
            if (index == 0) {
                int lines = 0xb6 - *(volatile u16 *)0x04000006;
                if (lines <= -42) lines += 0x107;
                if (lines < 0) return 0;
            }
            if (!func_01ff8000(handle, source, dest, bytes)) return 0;
            done += count;
            stream->offset += count;
            stream->sample = done;
            if (last) {
                stream->offset = self->info->start;
                if (self->info->mode == 0) {
                    int remain = samples - count;
                    if (remain > 0) func_020945f4(dest + bytes, 0, remain * stride);
                    done = samples;
                    stream->sample = (u16)samples;
                    stream->offset = self->info->end;
                    self->flags |= 2;
                }
            }
        }
        total += done;
        i++;
        stream = (Stream *)((char *)stream + 12);
    } while (i < self->channels);
    if (total != samples * self->channels) return 0;
    base->pos = base->offset;
    base->sequence++;
    return 1;
}






