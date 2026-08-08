/* data_020c59ec (68 bytes, 4-aligned): packed key word + 16-pointer table.
 * Consumer: src/main/func_0201af80.s (permanently .s, permuter-class per
 * docs/research/dossiers/0201af80.md) loads only word 0
 * (docs/research/c-match-prep/0201af80.c:41-49) and extracts three packed
 * bitfields: b=bits[7:0], c=bits[15:12], a=bits[19:12] (low nibble
 * overlaps c), compared against func_02018f80()/func_02018f90()/caller
 * arg. relocs.txt: word0 (offset+0x00) has no reloc (plain packed value);
 * offsets +0x04..+0x40 (16 consecutive words) are all relocations to
 * data_020c5a30.._020c5b78 (already-named placeholders clustered
 * immediately after this symbol). No known consumer reads the 16-pointer
 * half -- byte-correct, semantics unresolved.
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
extern char data_020c5a30[], data_020c5a40[], data_020c5a50[], data_020c5a58[];
extern char data_020c5a60[], data_020c5a68[], data_020c5a70[], data_020c5a78[];
extern char data_020c5a80[], data_020c5a88[], data_020c5a98[], data_020c5aa8[];
extern char data_020c5b30[], data_020c5b3c[], data_020c5b54[], data_020c5b78[];

typedef struct {
    unsigned int key0;   /* packed: bits[7:0]=b, bits[15:12]=c, bits[19:12]=a (a's low nibble == c) */
    void *slot[16];      /* unresolved semantics; no known reader */
} data_020c59ec_t;

data_020c59ec_t data_020c59ec = {
    0x0012d60a,
    {
        &data_020c5a78, &data_020c5a98, &data_020c5a30, &data_020c5a68,
        &data_020c5a88, &data_020c5b78, &data_020c5b3c, &data_020c5b30,
        &data_020c5b54, &data_020c5a58, &data_020c5a70, &data_020c5a40,
        &data_020c5a60, &data_020c5aa8, &data_020c5a80, &data_020c5a50,
    }
};
