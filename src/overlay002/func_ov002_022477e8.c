typedef struct { unsigned int id:13; unsigned int mid:13; unsigned int cost:6; } Entry;
typedef struct { Entry entry; char pad[0x10]; } Slot;
typedef struct { char pad[0x30]; Slot slots[5]; char tail[0x7d4]; } Side;
typedef struct { unsigned short id; unsigned short side:1; unsigned short unused:15; unsigned short pad[2]; unsigned short index; } Request;
extern Entry data_ov002_022cacc0[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern struct { char pad[0x5ac]; int cost; int limit; } data_ov002_022ce288;
extern int func_ov002_02246e5c(int arg0, int arg1);
extern int func_ov002_02246ecc(int, int);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_022470c4(Request *, int, int, int);
extern int func_ov002_021bc288(int, int);
extern int func_0202e234(int x);
extern int func_ov002_02246f68(int arg0, int arg1);
extern int func_ov002_0224701c(int arg0);
int func_ov002_022477e8(Request *req, int index) {
    int side, id, value, sum;

    Entry *p;
    int i, j;
    if (func_ov002_02246e5c(req->id, index) == 0) return 0;
    if (func_ov002_02246ecc(req->side, index) == 0) return 0;
    if (func_ov002_021ca3f0(req->side, data_ov002_022cacc0[index].id) == 0) return 0;
    req->index = index;
    data_ov002_022ce288.cost = data_ov002_022cacc0[index].cost;
    data_ov002_022ce288.limit = 0xff;
    if (func_ov002_021bc6c4(req->side) < 0) {
        for (i = 0; i < 5; i++) {
            if (((Side *)data_ov002_022cf16c)[req->side & 1].slots[i].entry.id != 0) {
                if (func_ov002_022470c4(req, req->side, 0, i) != 0) {
                    if (func_ov002_021bc288(req->side, i) != 0) return 1;
                }
            }
        }
        return 0;
    }
    if (req->id == 0x1698 || req->id == 0x1716 || req->id == 0x19d9) {
        id = data_ov002_022cacc0[index].id;
        for (side = 0; side < 2; side++) {
            j = 0;
            p = (Entry *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
            do {
                if (((Side *)data_ov002_022cf16c)[side & 1].slots[j].entry.id != 0) {
                    if (func_ov002_022470c4(req, side, 0, j) != 0) return 1;
                }

                j++;
            } while (j < 5);
        }
        i = 0;
        if (i < *(unsigned int *)(data_ov002_022cf178 + (req->side & 1) * 0x868)) {
            do {
                value = ((Entry *)(data_ov002_022cf16c + (req->side & 1) * 0x868 + 0x120))[i].id;
                if (func_0202e234(value) != 0) {
                    if (value == id) id = -1;
                    else if (func_ov002_022470c4(req, req->side, 0xb, i) != 0) return 1;
                }
                i++;
            } while (i < *(unsigned int *)(data_ov002_022cf16c + (req->side & 1) * 0x868 + 0xc));
        }
    } else {
        sum = func_ov002_02246f68(req->side, data_ov002_022cacc0[index].id);
        sum += func_ov002_0224701c(req->side);
        return sum >= (int)data_ov002_022cacc0[index].cost;
    }
    return 0;
}










