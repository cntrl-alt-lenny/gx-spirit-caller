struct QueueState { int pad[3]; volatile unsigned int count; };
extern struct QueueState data_ov002_022cdc78;
struct CardWord { unsigned int bits; };
extern struct CardWord data_ov002_022cdc88[];
extern unsigned short data_ov002_022ce088[];
extern char data_ov002_022cf19c[];
extern char data_ov002_022cf28c[];
extern char data_ov002_022cf3cc[];
extern char data_ov002_022cf50c[];
extern char data_ov002_022cf584[];
extern char data_ov002_022cf73c[];
void func_ov002_02253458(int player, int kind, int idx) {
    struct CardWord value;
    unsigned int index;

    switch (kind) {
    case 12:
        value = ((struct CardWord *)(data_ov002_022cf50c + (player & 1) * 0x868))[idx];
        index = data_ov002_022cdc78.count;
        data_ov002_022cdc88[index] = value;
        data_ov002_022ce088[data_ov002_022cdc78.count] = 12;
        break;
    case 13:
        value = ((struct CardWord *)(data_ov002_022cf3cc + (player & 1) * 0x868))[idx];
        index = data_ov002_022cdc78.count;
        data_ov002_022cdc88[index] = value;
        data_ov002_022ce088[data_ov002_022cdc78.count] = 13;
        break;
    case 14:
        value = ((struct CardWord *)(data_ov002_022cf584 + (player & 1) * 0x868))[idx];
        index = data_ov002_022cdc78.count;
        data_ov002_022cdc88[index] = value;
        data_ov002_022ce088[data_ov002_022cdc78.count] = 14;
        break;
    case 15:
        value = ((struct CardWord *)(data_ov002_022cf73c + (player & 1) * 0x868))[idx];
        index = data_ov002_022cdc78.count;
        data_ov002_022cdc88[index] = value;
        data_ov002_022ce088[data_ov002_022cdc78.count] = 15;
        break;
    case 11:
        value = ((struct CardWord *)(data_ov002_022cf28c + (player & 1) * 0x868))[idx];
        index = data_ov002_022cdc78.count;
        data_ov002_022cdc88[index] = value;
        data_ov002_022ce088[data_ov002_022cdc78.count] = 11;
        break;
    default:
        value = *(struct CardWord *)(data_ov002_022cf19c + (player & 1) * 0x868 + kind * 20);
        index = data_ov002_022cdc78.count;
        data_ov002_022cdc88[index] = value;
        data_ov002_022ce088[data_ov002_022cdc78.count] = kind;
        break;
    }
    data_ov002_022cdc78.count += data_ov002_022cdc78.count < 255 ? 1 : 0;
}
















