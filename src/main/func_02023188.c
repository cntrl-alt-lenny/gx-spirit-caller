typedef struct { char pad[0x74]; short end, start; } Queue;
typedef struct { char pad[0x38]; void *data; } Entry;
extern Queue data_0219a834;
extern char data_02197434[];
extern void Task_Invoke(void *p);

int func_02023188(void) {
    char *base = data_02197434;
    Entry *e;
    short index = data_0219a834.start;

    if (index != data_0219a834.end) {

        do {
            e = &((Entry *)(base + 0x12b4))[index];
            if (e->data != 0) {
                Task_Invoke(e->data);
                e->data = 0;
            }
            (*(short *)(base + 0x3474))++;
            if (((Queue *)(base + 0x3400))->end >= 0x90)
                ((Queue *)(base + 0x3400))->end = 0;
            index = ((Queue *)(base + 0x3400))->start;
        } while (index != ((Queue *)(base + 0x3400))->end);
    }
    return 1;
}



