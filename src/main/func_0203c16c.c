typedef struct { int f_0; char pad[6]; unsigned short h_a; } state_0_a_t;
typedef struct { void *head, *tail; unsigned short count, offset; } List;
typedef struct Stream { char p0[4]; short produced; char p6[0x1a]; unsigned int pos; short consumed; char p26[6]; unsigned int saved; char p30[8]; unsigned int saved2; } Stream;
typedef struct Info { char p0[0x1a]; unsigned char channels; char p1b[5]; unsigned int start; } Info;
typedef struct self_t { char p0[0x70]; unsigned int end; Info *info; Stream *stream; char p7c[4]; char *buffer; char p84[0x2c]; unsigned short flags; char pb2[4]; unsigned short step, channels; short count; char pbc[4]; signed char countdown; } self_t;
typedef struct Node { char p0[8]; self_t *self; int *dest[2]; unsigned int size; } Node;
extern char data_0219b36c[], data_0219d070[], data_0219d07c[];
/* The assembly return is used despite the existing definition's void type. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern int func_0207cfdc(state_0_a_t *p, char *q);
extern void func_0207cff4(List *list, void *node);
extern void func_0207d12c(char *r0, char *r1);
extern void func_02091a8c(void *q);
extern void func_020927b8(char *self);
extern void func_02092748(void *self);
extern void func_02094504(int value, int *dst, unsigned int count);
extern void func_02094550(int *src, int *dst, unsigned int count);
extern void func_0203af44(void *p);
extern int func_0203b774(self_t *self, int a1, int a2);
void func_0203c16c(void) {
    int irq;
    int i;
    Stream *stream;
    self_t *self;
    unsigned int size;
    Node *node;
    for (;;) {
        func_02091a8c(0);
        for (;;) {
            func_020927b8(data_0219b36c);
            irq = OS_DisableIrq();
            node = (Node *)func_0207cfdc((state_0_a_t *)data_0219d070, 0);
            if (node) {
                node->self->count--;
                func_0207cff4((List *)data_0219d070, node);
            }
            OS_RestoreIrq(irq);
            if (!node) {
                func_02092748(data_0219b36c);
                break;
            }
            self = node->self;
            if (self->flags & 0x8000) {
                stream = self->stream;
                if (self->flags & 4) {
                    self->countdown--;
                    if (self->countdown <= 0) self->flags |= 0x801;
                }
                if (!(self->flags & 0x4000)) {
                    if (stream->consumed >= 3) self->flags |= 0x4000;
                }
                if (self->stream->produced >= 8 && stream->consumed >= 8) {
                    self->stream->produced &= 7;
                    stream->consumed &= 7;
                }
                size = node->size;
                if (!(self->flags & 0x4000) || (self->flags & 5)) {
                    i = 0;
                    do {
                        func_02094504(0, node->dest[i], size);
                        i++;
                    } while (i < self->info->channels);
                    if (!(self->flags & 0x4000)) stream->consumed++;
                } else {
                    if (self->stream->produced - stream->consumed <= 0) {
                        func_0203af44(&stream->pos);
                        stream->saved = stream->saved2 = stream->pos;
                        func_0203b774(self, (int)&node->dest[0], 1);
                    } else {
                        int offset;
                        unsigned int slot;
                        int channel;
                        channel = 0;
                        slot = (unsigned int)stream->consumed << 29;
                        offset = 0;
                        do {
                            func_02094550((int *)(self->buffer + offset + (slot >> 20)), node->dest[channel], size);
                            offset += 0x1000;
                            channel++;
                        } while (channel < self->channels);
                        {
                            unsigned int pos = stream->pos + self->step;
                            unsigned int end = self->end;
                            if (pos >= end) {
                                pos = self->info->start + (pos - end);
                                if (self->flags & 2) pos = end;
                            }
                            stream->pos = pos;
                        }
                        stream->consumed++;
                    }
                    if (stream->pos >= self->end) {
                        self->flags |= 4;
                        self->countdown = 4;
                    }
                }
            }
            irq = OS_DisableIrq();
            func_0207d12c(data_0219d07c, (char *)node);
            OS_RestoreIrq(irq);
            func_02092748(data_0219b36c);
        }
    }
}




