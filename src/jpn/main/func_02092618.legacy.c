extern void *OSi_RemoveMutexLinkFromQueue(void *queue);
extern void func_02091924(void *p);

void func_02092618(void *self) {
    void *queue;
    if (*(int *)((char *)self + 0x88) == 0) {
        return;
    }
    queue = (char *)self + 0x88;
    do {
        void *obj = OSi_RemoveMutexLinkFromQueue(queue);
        *(int *)((char *)obj + 0xc) = 0;
        *(int *)((char *)obj + 0x8) = 0;
        func_02091924(obj);
    } while (*(int *)((char *)self + 0x88) != 0);
}
