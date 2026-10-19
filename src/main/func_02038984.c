extern int func_01ff8000(int *pos, int offset, void *buf, int count);
/* Existing thunk is declared void, but this caller consumes its int result. */
extern int func_02037ab8(void *p);
extern void *func_02088d7c(void);
extern void func_02091768(int ticks);

int func_02038984(int *pos, void *buf, int len, int wait) {
    int lines;
    int chunk;
    int done = 0;
    if (*pos == 0) return -1;
    if (func_02088d7c() != 0) {
        while (done < len) {
            if (func_02037ab8((void *)1) == 0) {
                chunk = 0x200;
                while (done < len) {
                    lines = 0xb6 - *(volatile unsigned short *)0x04000006;
                    if (lines <= -42) lines += 0x107;
                    if (lines < 0) break;
                    if (done + chunk > len) chunk = len - done;
                    if (!func_01ff8000(pos, done, buf, chunk)) break;
                    done += chunk;
                    buf = (char *)buf + chunk;
                }
            }
            if (wait) func_02091768(1);
        }
    } else {
        int count;
        if (done < len) do {
            count = *(volatile unsigned short *)0x04000006;
            count = 0xc0 - count;
            if (count < 0) count += 0x107;
            count <<= 6;
            count &= -512;
            if (count != 0) {
                if (done + count > len) count = len - done;
                if (!func_01ff8000(pos, done, buf, count)) break;
                buf = (char *)buf + count;
                done += count;
            }
            if (wait) func_02091768(1);
        } while (done < len);
    }
    return done;
}



















