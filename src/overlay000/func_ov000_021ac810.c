struct ov000_021c758c_s {
    char _pad0[0x4];
    unsigned int f_4 : 4;
};

extern struct ov000_021c758c_s data_ov000_021c758c;

void func_ov000_021ac810(int v) {
    data_ov000_021c758c.f_4 = v << 12;
}
