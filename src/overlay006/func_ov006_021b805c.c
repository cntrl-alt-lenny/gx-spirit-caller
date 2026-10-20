typedef unsigned char u8;
typedef unsigned short u16;
typedef struct { u16 id; u8 count; u8 pad; } Entry;
extern void Fill32(unsigned int value, void *dest, unsigned int size);
extern void func_02094688(const void *src, void *dest, unsigned int size);
int func_ov006_021b805c(char *base) {

    Fill32(0, base + 0x124, 0x124);
    func_02094688(base + 1, base + 0x125, 0x19);
    *(u8 *)(base + 0x124) = *(u8 *)base;
    {
    int count, n, i, j;
    Entry *entry;
    n = 0;
    count = *(u16 *)(base + 0x8162);
    i = 0;
    if (count > 0) {
      entry = (Entry *)(base + 0x7a60);
      do {
        for (j = 0; j < entry->count; j++) {
            ((u16 *)(base + 0x14c))[n] = entry->id;
            n++;
        }
        i++;
        entry++;
      } while (i < count);
    }
    *(int *)(base + 0x140) = n;
    }
    {
    int count, n, i;
    Entry *entry;
    int j;
    count = *(u16 *)(base + 0x8164);
    n = 0;
    i = 0;
    if (count > 0) {
      entry = (Entry *)(base + 0x7c60);
      do {
        for (j = 0; j < entry->count; j++) {
            ((u16 *)(base + 0x1ec))[n] = entry->id;
            n++;
        }
        i++;
        entry++;
      } while (i < count);
    }
    *(int *)(base + 0x144) = n;
    }
    {
    int count, n, i;
    Entry *entry;
    int j;
    count = *(u16 *)(base + 0x8166);
    n = 0;
    i = 0;
    if (count > 0) {
      entry = (Entry *)(base + 0x7e60);
      do {
        for (j = 0; j < entry->count; j++) {
            ((u16 *)(base + 0x20a))[n] = entry->id;
            n++;
        }
        i++;
        entry++;
      } while (i < count);
    }
    *(int *)(base + 0x148) = n;
    }
    return 1;
}





