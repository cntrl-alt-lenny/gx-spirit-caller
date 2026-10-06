typedef struct {
    int _f0;
    int handle; /* +0x4 */
    int _f8;
} Slot;

extern Slot data_0219dcb4[];
extern void func_0204548c(int a, int b, int c);
extern void Fill32(int v, void *dst, int size);

void func_0204b370(void) {
    int i;
    Slot *slot = data_0219dcb4;
    for (i = 0; i < 0x9a; i++) {
        if (slot->handle != 0) {
            func_0204548c(4, slot->handle, 0);
        }
        slot++;
    }
    Fill32(0, data_0219dcb4, 0x9a * sizeof(Slot));
}
