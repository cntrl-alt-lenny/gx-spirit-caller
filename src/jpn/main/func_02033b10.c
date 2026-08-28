extern int func_020530fc(void *p);
extern int func_02033a30(signed char *p, int key);
extern int func_02033a70(void *p0, void *slot, int r2, int r3val, int last);

void func_02033b10(void *p0, void *p1, int p2, int p3, int p4) {
    int off = p3 * 12;
    void *combined = (char *)p1 + off;

    if (func_020530fc(combined) == 0) {
        return;
    }

    {
        int idx = func_02033a30((signed char *)p0, p3);
        if (idx >= 0) {
            char *list = *(char **)((char *)p0 + 0xc);
            void *slot = list + idx * 4;
            int flag = *(int *)((char *)p0 + 0x10);
            int r2v;
            if (flag != 0) {
                r2v = flag + idx * 260;
            } else {
                r2v = 0;
            }
            func_02033a70(p0, slot, r2v, combined, -1);
            return;
        }
    }

    {
        signed char cnt = *(signed char *)((char *)p0 + 3);
        if (cnt >= p2) {
            return;
        }

        {
            int flag;
            void *slot;
            int r2v;
            int result;

            (*(char **)((char *)p0 + 0xc))[cnt * 4] = (char)p3;

            slot = *(char **)((char *)p0 + 0xc) + cnt * 4;
            flag = *(int *)((char *)p0 + 0x10);
            if (flag != 0) {
                r2v = flag + cnt * 260;
            } else {
                r2v = 0;
            }

            result = func_02033a70(p0, slot, r2v, combined, p4);
            if (result != 0) {
                *(signed char *)((char *)p0 + 3) = (signed char)(cnt + 1);
            }
        }
    }
}
