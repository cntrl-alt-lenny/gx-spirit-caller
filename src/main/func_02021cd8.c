typedef struct {
    unsigned *pc;
    int timer;
    char pad[0x40];
    unsigned *active[4];
    unsigned *stack[4];
} State;
extern int func_020214ac(void *p, unsigned *script);
extern int func_020215ec(int a0);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_02022260(void *p, int idx, unsigned int v);
extern int func_020222a0(char *base, int op, int idx, int rhs);
extern int func_02022430(int a, unsigned flags, int c, int b);
extern int func_020224c0(char *base, int mode, int val);
int func_02021cd8(State *s) {
    int stop = 0;
    int done = 0;
    unsigned *start = s->pc;
    int mode5, mode6, mode9;
    unsigned word;
    int i;

    while (!stop && !done) {
        word = *s->pc;
        switch (word >> 24) {
        case 0x12: s->pc++; break;
        case 0xf0: stop = 1; break;
        case 0x10:
            for (i = 0; i < 4; i++) { if (!s->stack[i]) break; }
            s->stack[i] = s->pc + 2;
            s->pc = (unsigned *)s->pc[1];
            break;
        case 0x11:
            for (i = 3; i >= 0; i--) { if (s->stack[i]) break; }
            s->pc = s->stack[i];
            s->stack[i] = 0;
            break;
        case 0xf2:
            if (s->timer < func_020224c0((char *)s, (word >> 16) & 0xff, (unsigned short)word)) stop = 1;
            else s->pc++;
            break;
        case 0xf5: {
            int count, val; unsigned short timeout;
            mode5 = (word >> 16) & 0xff;
            if (mode5 >= 0x20) func_02022260(s, mode5 - 0x20, (unsigned short)word);
            else if (mode5 < 0x1c) func_02022234(mode5, (unsigned short)word);
            s->pc++;
            break;
        }
        case 0xf6: {
            int count, val; unsigned short timeout;
            mode6 = (word >> 16) & 0xff;
            val = word & 0xff;
            if (mode6 >= 0x20) func_02022260(s, mode6 - 0x20, func_020224c0((char *)s, 1, val));
            else if (mode6 < 0x1c) func_02022234(mode6, func_020224c0((char *)s, 1, val));
            s->pc++;
            break;
        }
        case 0xf7: {
            int mode, count, val; unsigned short timeout;
            val = (short)func_020224c0((char *)s, (word >> 16) & 0xff, (unsigned short)s->pc[1]);
            func_020222a0((char *)s, (word >> 8) & 0xff, word & 0xff, val);
            s->pc += 2;
            break;
        }
        case 0xf8: s->pc = (unsigned *)s->pc[1]; break;
        case 0xf9: {
            int count, val; unsigned short timeout;
            mode9 = (word >> 16) & 0xff;
            count = word & 0xff;
            val = (short)func_020224c0((char *)s, 1, (word >> 8) & 0xff);
            if (val < 0) stop = 1;
            else if (val >= count) s->pc += count + 1;
            else switch (mode9) {
            case 0: s->pc = (unsigned *)s->pc[val + 1]; break;
            case 1:
                for (i = 0; i < 4; i++) { if (!s->stack[i]) break; }
                s->stack[i] = s->pc + count + 1;
                s->pc = (unsigned *)s->pc[val + 1];
                break;
            case 2:
                func_020214ac(0, (unsigned *)s->pc[val + 1]);
                func_020215ec(8);
                stop = 1;
                break;
            }
            break;
        }
        case 0xfa: {
            int mode, count, val; unsigned short timeout;
            val = (short)func_020224c0((char *)s, (word >> 16) & 0xff, (unsigned short)s->pc[1]);
            if (!func_02022430((int)s, (word >> 8) & 0xff, word & 0xff, val)) stop = 1;
            else s->pc += 2;
            break;
        }
        case 0xfb: {
            int mode, count, val; unsigned short timeout;
            val = (short)func_020224c0((char *)s, (word >> 16) & 0xff, (unsigned short)s->pc[1]);
            timeout = s->pc[1] >> 16;
            if (func_02022430((int)s, (word >> 8) & 0xff, word & 0xff, val)) s->pc = (unsigned *)s->pc[2];
            else if (s->timer < timeout) stop = 1;
            else s->pc += 3;
            break;
        }
        case 0xfc:
            for (i = 0; i < 4; i++) { if (s->pc == s->active[i] || !s->active[i]) break; }
            if (i < 4) s->active[i] = s->pc;
            s->pc += 3;
            break;
        case 0xfd:
            for (i = 0; i < 4; i++) s->active[i] = 0;
            s->pc++;
            break;
        case 0xfe:
            s->pc++;
            func_020214ac(0, (unsigned *)*s->pc);
            func_020215ec(8);
            stop = 1;
            break;
        case 0xff:
            switch (func_020224c0((char *)s, (word >> 16) & 0xff, (unsigned short)word)) {
            case 0: func_020215ec(1); break;
            case 1: func_020215ec(2); break;
            case 2: func_020215ec(4); break;
            }
            stop = 1;
            s->pc++;
            done = 1;
            break;
        default: done = 1; break;
        }
        if (s->pc != start) s->timer = 0;
    }
    return stop;
}




