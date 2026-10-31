typedef struct Node Node;
typedef struct Context Context;
struct Node { Node *prev, *next; Context *ctx; unsigned flags; int type, result; int queue[2]; int f20, f24; int end, pos; int buffer, requested, count; };
typedef struct { char pad[0xc]; unsigned int flags; char pad2[4]; int f14; int queue[2]; } Dev;
extern int func_02097848(Node *self, int type);
extern int func_02097f20(Dev *dev);
int func_020981a0(Node *self, int buffer, int size, int async) {
    int old = self->pos;
    int requested = size;
    if (size > self->end - old) size = self->end - old;
    if (size < 0) size = 0;
    self->buffer = buffer;
    self->requested = requested;
    self->count = size;
    if (async == 0) self->flags |= 4;
    func_02097848(self, 0);
    if (async == 0) {
        if (func_02097f20((Dev *)self) != 0) size = self->pos - old;
        else size = -1;
    }
    return size;
}
