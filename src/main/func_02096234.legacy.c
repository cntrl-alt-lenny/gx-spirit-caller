extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
typedef union {
    unsigned int raw;
    struct { unsigned int tag:5; unsigned int error:1; unsigned int data:26; } bits;
} Word;
extern void (*data_021a8288[])(int, unsigned int, int);
void func_02096234(void) {
    Word word;
    int status;
    for (;;) {
        if (*(volatile unsigned short *)0x04000184 & 0x4000) {
            *(volatile unsigned short *)0x04000184 |= 0xc000;
            status = -3;
        } else {
            int irq = OS_DisableIrq();
            if (*(volatile unsigned short *)0x04000184 & 0x100) {
                OS_RestoreIrq(irq);
                status = -4;
            } else {
                word.raw = *(volatile unsigned int *)0x04100000;
                OS_RestoreIrq(irq);
                status = 0;
            }
        }
        if (status == -4) return;
        if (status == -3) continue;
        if (word.bits.tag != 0) {
            void (*handler)(int, unsigned int, int) = data_021a8288[word.bits.tag];
            if (handler != 0) {
                handler(word.bits.tag, word.bits.data, word.bits.error);
            } else if (word.bits.error == 0) {
                word.raw |= 0x20;
                if (*(volatile unsigned short *)0x04000184 & 0x4000) {
                    *(volatile unsigned short *)0x04000184 |= 0xc000;
                } else {
                    int irq = OS_DisableIrq();
                    if (*(volatile unsigned short *)0x04000184 & 2) {
                        OS_RestoreIrq(irq);
                    } else {
                        *(volatile unsigned int *)0x04000188 = word.raw;
                        OS_RestoreIrq(irq);
                    }
                }
            }
        }
    }
}
