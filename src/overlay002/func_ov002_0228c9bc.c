extern int func_0202b8f0(int unused0);
/* This caller passes the card ID in r0; the existing definition ignores it. */
extern int func_0202b920(int id);
struct CardEntry { unsigned int id : 13; unsigned int flags : 19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];

int func_ov002_0228c9bc(int a, int (*callback)(int, int, unsigned int), int x, int y)
{
    unsigned int offset = (a & 1) * 0x868;
    unsigned int i;
    int id;
    struct CardEntry *entry;
    int best = -1;
    int result = -1;
    char *base;
    i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf178 + offset)) {
    base = data_ov002_022cf16c + offset;
    entry = (struct CardEntry *)(base + 0x120);
    do {
        if (callback(a, 11, i)) {
            id = entry->id;
            int value = 0;
            if (x && y) {
                int first = func_0202b8f0(id);
                if (first > func_0202b920(id))
                    value = func_0202b8f0(id);
                else
                    value = func_0202b920(id);
            } else if (x) {
                value = func_0202b8f0(id);
            } else if (y) {
                value = func_0202b920(id);
            }
            if (best < 0) {
                best = value;
                result = i;
            } else {
                int update = 0;
                if (x > 0 && value > best) update = 1;
                if (x < 0 && value < best) update = 1;
                if (y > 0 && value > best) update = 1;
                if (y < 0 && value < best) update = 1;
                if (update) {
                    if (x > 0 && value > best) best = value;
                    if (x < 0 && value < best) best = value;
                    result = i;
                    if (y > 0 && value > best) best = value;
                    if (y < 0) {
                        best = value < best ? value : best;
                    }
                }
            }
        }
        entry++;
        i++;
    } while (i < *(unsigned int *)(base + 0xc));
    }
    return result;
}











