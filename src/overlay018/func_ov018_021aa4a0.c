typedef struct { unsigned short pad : 3; unsigned short pending : 1; } Flags;
extern char data_ov018_021ad860[];
extern char data_ov018_021ad8a8[];
extern char data_ov018_021ae160[];
extern int func_0201e5b8(void *cfg);
extern void Task_Invoke(void *p);
void func_ov018_021aa4a0(void) {
    char *st = data_ov018_021ad860;
    char *bg = data_ov018_021ad8a8;
    *(volatile unsigned int *)0x04000010 = (*(unsigned int *)(st + 0x96c) & 0x1ff) | ((*(unsigned int *)(st + 0x970) << 16) & 0x1ff0000);
    *(volatile unsigned int *)0x04000014 = (*(unsigned int *)(st + 0x974) & 0x1ff) | ((*(unsigned int *)(st + 0x978) << 16) & 0x1ff0000);
    *(volatile unsigned int *)0x04000018 = (*(unsigned int *)(st + 0x97c) & 0x1ff) | ((*(unsigned int *)(st + 0x980) << 16) & 0x1ff0000);
    *(volatile unsigned int *)0x0400001c = (*(unsigned int *)(st + 0x984) & 0x1ff) | ((*(unsigned int *)(st + 0x988) << 16) & 0x1ff0000);
    *(volatile unsigned int *)0x04001010 = (*(unsigned int *)(st + 0x98c) & 0x1ff) | ((*(unsigned int *)(st + 0x990) << 16) & 0x1ff0000);
    *(volatile unsigned int *)0x04001014 = (*(unsigned int *)(st + 0x994) & 0x1ff) | ((*(unsigned int *)(st + 0x998) << 16) & 0x1ff0000);
    *(volatile unsigned int *)0x04001018 = (*(unsigned int *)(st + 0x99c) & 0x1ff) | ((*(unsigned int *)(st + 0x9a0) << 16) & 0x1ff0000);
    *(volatile unsigned int *)0x0400101c = (*(unsigned int *)(st + 0x9a4) & 0x1ff) | ((*(unsigned int *)(st + 0x9a8) << 16) & 0x1ff0000);
    if (((Flags *)(data_ov018_021ae160 + 0xfc))->pending == 1) {
        func_0201e5b8(bg + 0x98c);
        Task_Invoke(*(void **)(bg + 0x988));
        *(void **)(bg + 0x988) = 0;
        *(unsigned short *)(bg + 0x9b4) &= ~8;
    }
}

