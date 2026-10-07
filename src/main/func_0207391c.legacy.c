extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
/* The target rereads the queue cursor before indexing and after updating it. */
extern volatile unsigned int data_0219eefc;
extern unsigned char *data_0219ef24;
extern volatile unsigned int data_0219ef28;
void func_0207391c(void)
{
    int state = OS_DisableIrq();
    data_0219eefc = data_0219eefc + *(unsigned short *)(data_0219ef24 + data_0219eefc);
    if (data_0219eefc >= data_0219ef28) data_0219eefc = 0;
    OS_RestoreIrq(state);
}
