/* data_ov000_021b55e4 (28 bytes, 4-aligned): command-record descriptor --
 * word0 is a genuine callback pointer (relocs.txt ov000:625
 * from:0x021b55e4 kind:load to:0x021ad5e4 -> func_ov000_021ad5e4).
 * Consumer: func_ov000_021ad660 (src/overlay000/func_ov000_021ad660.s:195
 * _LIT14, relocs.txt ov000:237 from:0x021ad8d4 kind:load to:0x021b55e4):
 * `ldr r1,[r5,r8,lsl#2]` (line 162) with the loop's r8 pinned to 0 by
 * `cmp r8,#1; bcc` (lines 176-178), so only word0 is ever dereferenced;
 * it is passed to func_ov000_021ac530(ctx, r1) (line 164), a matched
 * setter (src/overlay000/ov000_021ac530.c: `*(int*)((char*)p+0x10)=v;`)
 * that just stashes the raw value -- confirming it's a callback slot, not
 * itself called at this site. func_ov000_021ad5e4 remains unmatched (.s);
 * its own disasm shows it takes at least one pointer-ish arg (r0 is
 * dereferenced), but since it's never invoked through this field in the
 * traced code, the extern below is kept deliberately minimal.
 * Words 1-6 are not dereferenced by the one known reader, and no reloc
 * targets any address in 0x021b55e8..0x021b55ff -- kept as plain ints.
 * (Not consumer-proven, just an observation: 0xc/0x10/0x1c equal the byte
 * sizes of sibling records data_ov000_021b5638/5650 (0xc bytes each),
 * data_ov000_021b5600 (0x10 bytes) and this record itself (0x1c bytes).)
 */
extern void func_ov000_021ad5e4(void);

typedef struct {
    void (*callback)(void);
    int f04, f08, f0c, f10, f14, f18;
} data_ov000_021b55e4_t;

const data_ov000_021b55e4_t data_ov000_021b55e4 = {
    func_ov000_021ad5e4, 0x40, 0x20, 0x00, 0x0c, 0x10, 0x1c
};
