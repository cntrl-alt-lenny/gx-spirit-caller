extern char *GetSystemWork(void);
extern int func_02019210(int x);
extern void func_0201afdc(int, int, void *, int *);
struct Card { unsigned id:16; unsigned rest:16; };
struct Entry { unsigned pad[2]; unsigned owner:8; unsigned flag:1; unsigned card:8; unsigned rest:15; unsigned tail[3]; };
struct Total { unsigned count:8; unsigned rest:24; };
void func_0201b504(int owner) {
    char *sys = GetSystemWork();
    int count = 0;
    struct Card cards[16];
    int i;
    func_0201afdc(owner, 1, cards, &count);
    for (i = 0; i < count; i++) {
        struct Entry *entry = &((struct Entry *)sys)[func_02019210(cards[i].id) - 1];
        entry->owner = owner;
        entry->card = cards[i].id;
    }
    ((struct Total *)(sys + 0x8f8))->count += count;
}
