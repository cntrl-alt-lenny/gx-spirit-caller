typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { unsigned char pad[0x19]; unsigned char mode; unsigned char pad1[6]; u32 start, end, base, blocks, size, last, lastsize, lastlen; } Info;
typedef struct { u32 pos; unsigned char pad[8]; u32 offset; u16 sample, block; unsigned char tail[12]; } Stream;
typedef struct { unsigned char pad[0x60]; int handles[2]; u32 base; unsigned char pad6c[8]; Info *info; Stream *streams; unsigned char pad7c[8]; char *buffer; unsigned char pad88[0x28]; u16 flags; unsigned char padb2[6]; u16 channels; } Obj;
extern int func_01ff8000(int *pos, int offset, void *buf, int count);
int func_0203b158(Obj *self, int index) {
    u32 i;
    u32 block;
    u32 offset;
    int last;
    Stream *stream;
    int *handle;
    block = self->streams[index].pos / 0x3f8;
    stream = &self->streams[index];
    handle = &self->handles[index];
    u32 blockOffset = block * 0x3f8;
    void *buffers[2];
    buffers[0] = self->buffer + (index << 9);
    buffers[1] = self->buffer + 0x400 + (index << 9);
    i = 0;
    do {
        if (block != stream->block) {
            offset = self->info->last;
            u32 len = self->info->size;
            last = 0;
            u32 source;
            if (block + 1 >= self->info->blocks) {
                offset = self->info->lastlen;
                len = self->info->lastsize;
                last = 1;
            }
            source = self->info->base + self->base + self->channels * (block << 9);
            source += i * len;
            if (index == 0) {
                int lines = 0xb6 - *(volatile u16 *)0x04000006;
                if (lines <= -42) lines += 0x107;
                if (lines < 0) return 0;
            }
            if (!func_01ff8000(handle, source, buffers[i], len)) return 0;
            stream->offset = blockOffset + offset;
            stream->block = (u16)block;
            if (last) {
                stream->offset = self->info->start;
                if (self->info->mode == 0) {
                    stream->offset = self->info->end;
                    self->flags |= 2;
                }
            }
        }
        stream = (Stream *)((char *)stream + 12);
        i++;
    } while (i < self->channels);
    return 1;
}







