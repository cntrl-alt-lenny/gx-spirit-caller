typedef struct State State;
typedef struct { int a; unsigned short b,c; int d; } Entry;
typedef struct { Entry entry; int directory; int length; unsigned char name[128]; } Record;
typedef struct Obj {
    int pad0[2]; State *state; unsigned int flags; int pad10; int result;
    int pad18[2]; Entry current; int parent; Entry request;
    unsigned char *path; int directory; Entry *out;
} Obj;
extern int func_020965ac(Obj *obj, int index);
extern void func_02097074(void *a0, int a1);
extern int func_02097154(const unsigned char *a, const unsigned char *b, unsigned int n);
static inline int component(int c) { int result = 0; if (c != 0 && c != 0x2f && c != 0x5c) result = 1; return result; }
int func_02096c08(Obj *self) {
    Record rec;
    unsigned char *path = self->path;
    int directory = self->directory;
    int isdir;
    int length;
    func_020965ac(self, 2);
    for (; *path; path += *path != 0) {
        for (length = 0; component(isdir = path[length]); length++) {}
        if (isdir != 0 || directory != 0) isdir = 1;
        if (length == 0) return 1;
        if (path[0] == '.') {
            if (length == 1) {
                path++;
                continue;
            }
            if ((length == 2) & (path[1] == '.')) {
                if (self->current.b != 0) func_02097074(self, self->parent);
                path += 2;
                continue;
            }
        }
        {
            if (length > 127) return 1;
            self->request.a = (int)&rec;
            *(int *)&self->request.b = 0;
            for (;;) {
                if (func_020965ac(self, 3) != 0) return 1;
                if (isdir != rec.directory) continue;
                if (length != rec.length) continue;
                if (func_02097154(path, rec.name, length) != 0) continue;
                break;
            }
            if (isdir != 0) {
                self->request = rec.entry;
                path += length;
                func_020965ac(self, 2);
            } else {
                if (directory != 0) return 1;
                typedef struct { int a,b; } File;
                *(File *)self->out = *(File *)&rec.entry;
                return 0;
            }
        }

    }
    { int result;
      if (directory == 0) result = 1;
      else { *self->out = self->current; result = 0; }
      return result; }
}




