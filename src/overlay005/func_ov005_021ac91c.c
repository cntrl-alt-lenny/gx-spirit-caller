typedef struct {
    char pad0[0xc];
    short start;
    char padE[6];
    unsigned short width;
    char pad16[10];
    unsigned short *map;
    unsigned short palette;
} Map;
void func_ov005_021ac91c(Map *o) {
    unsigned int p = (unsigned int)o->map + ((o->start >> 3) << 1);
    int x;
    int y;
    int tile = 1;
    for (y = 0; y < 32; y++) {

        for (x = 0; x < o->width; x++) {
            *(unsigned short *)p = (o->palette << 12) | tile++;
            p += 2;

        }
        p += (32 - o->width) << 1;
    }
}



