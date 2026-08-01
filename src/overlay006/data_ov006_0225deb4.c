typedef struct {
    int f0;                       /* +0x00: confirmed int (sinit ctor/dtor target; __register_global_object-registered) */
    unsigned char pad_04[0x34];    /* +0x04..+0x37: unconfirmed by any traced consumer */
    int f38;                      /* +0x38: confirmed int (func_ov006_021c6e40.c) */
    unsigned char pad_3c[0x10];    /* +0x3c..+0x4b: unconfirmed by any traced consumer (one unverified draft proposes an int here) */
    int f4c;                      /* +0x4c: confirmed int, dedicated setter func_ov006_021c6f7c.c */
    int f50;                      /* +0x50: confirmed int, dedicated setter func_ov006_021c6f88.c */
    int f54;                      /* +0x54: confirmed int, dedicated setter func_ov006_021c6f94.c */
    unsigned char text_58[0x20];   /* +0x58..+0x77: format/text buffer, presence confirmed (func_ov006_021c6e40.c via func_020a978c), exact width/content unconfirmed */
} Ov006Obj6d8c;

Ov006Obj6d8c data_ov006_0225deb4;
