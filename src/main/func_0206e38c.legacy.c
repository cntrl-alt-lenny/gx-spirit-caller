extern int func_0206e4a4(void);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_0206e33c(void *self);
extern int func_0206d79c(void *self);

int func_0206e38c(void *self) {
    int flags = 0;
    signed char b73;

    if (func_0206e4a4() != 0) {
        flags |= 0x80;
        goto end;
    }

    if ((*(volatile short *)((char *)self + 0x70) & 0x40) != 0) {
        flags |= 0x20;
    }

    if (*(signed char *)((char *)self + 0x73) == 1 ||
        (*(volatile short *)((char *)self + 0x70) & 0x4) != 0) {
        int state = OS_DisableIrq();
        if (func_0206e33c(self) > 0) {
            flags |= 0x1;
        }
        if (func_0206d79c(self) > 0) {
            flags |= 0x8;
        }
        OS_RestoreIrq(state);
    }

    {
        int cond = 1;
        b73 = *(signed char *)((char *)self + 0x73);
        if (b73 == 0) {
            cond = 1;
        } else if (b73 != 4) {
            cond = 0;
        }
        if (cond == 0) {
            goto end;
        }
    }

    if ((*(volatile short *)((char *)self + 0x70) & 0x4) != 0 &&
        *(unsigned char *)((char *)self + 0x8) != 4) {
        if ((flags & 0x1) == 0) {
            *(volatile short *)((char *)self + 0x70) &= ~0x6;
        }
    }

    if ((*(volatile short *)((char *)self + 0x70) & 0x2) == 0) {
        if ((*(volatile short *)((char *)self + 0x70) & 0x4) == 0) {
            flags |= 0x40;
        }
    }

end:
    return flags;
}
