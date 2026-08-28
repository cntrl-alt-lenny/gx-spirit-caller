extern void func_0207d044(void *hdr, void *b);
extern void func_0207cfe8(void *hdr, void *b);

void func_0207cf74(void *hdr, void *a, void *b) {
    if (a == 0) {
        func_0207d044(hdr, b);
        return;
    }
    if (a == *(void **)hdr) {
        func_0207cfe8(hdr, b);
        return;
    }
    {
        unsigned short off = *(unsigned short *)((char *)hdr + 0xa);
        char *aLink = (char *)a + off;
        char *bLink = (char *)b + off;
        void *aNext = *(void **)aLink;
        *(void **)bLink = aNext;
        *(void **)(bLink + 4) = a;
        *(void **)((char *)aNext + off + 4) = b;
        off = *(volatile unsigned short *)((char *)hdr + 0xa);
        *(void **)((char *)a + off) = b;
        {
            unsigned short *countPtr = (unsigned short *)((char *)hdr + 8);
            *countPtr = *countPtr + 1;
        }
    }
}
