; func_ov006_021b831c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .global func_ov006_021b831c
        .arm
func_ov006_021b831c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    cmp r5, #0x4
    addls pc, pc, r5, lsl #0x2
    b .L_714
    b .L_650
    b .L_678
    b .L_6a0
    b .L_6c8
    b .L_6f0
.L_650:
    cmp r4, #0x0
    addne r0, r6, #0x1d8
    addne r0, r0, #0x8000
    addeq r0, r6, #0x2a0
    add r1, r6, #0x198
    addeq r0, r0, #0x6000
    add r1, r1, #0x9800
    mov r2, #0x17c0
    bl Copy32
    b .L_714
.L_678:
    cmp r4, #0x0
    addne r0, r6, #0x158
    addne r0, r0, #0xb000
    addeq r0, r6, #0xa60
    add r1, r6, #0x358
    addeq r0, r0, #0x7000
    add r1, r1, #0xb000
    mov r2, #0x200
    bl Copy32
    b .L_714
.L_6a0:
    cmp r4, #0x0
    addne r0, r6, #0x358
    addne r0, r0, #0xb400
    addeq r0, r6, #0xc60
    add r1, r6, #0x158
    addeq r0, r0, #0x7000
    add r1, r1, #0xb800
    mov r2, #0x200
    bl Copy32
    b .L_714
.L_6c8:
    cmp r4, #0x0
    addne r0, r6, #0x158
    addne r0, r0, #0xbc00
    addeq r0, r6, #0xe60
    add r1, r6, #0x358
    addeq r0, r0, #0x7000
    add r1, r1, #0xbc00
    mov r2, #0x200
    bl Copy32
    b .L_714
.L_6f0:
    cmp r4, #0x0
    addne r0, r6, #0x358
    addne r0, r0, #0xc000
    addeq r0, r6, #0x60
    add r1, r6, #0x58
    addeq r0, r0, #0x8000
    add r1, r1, #0xc400
    mov r2, #0x100
    bl Copy32
.L_714:
    add r0, r6, r5, lsl #0x1
    cmp r4, #0x0
    addne r0, r0, #0xc600
    ldrneh r1, [r0, #0x58]
    addeq r0, r0, #0x8100
    ldreqh r1, [r0, #0x60]
    add r0, r6, r5, lsl #0x1
    add r0, r0, #0xc600
    strh r1, [r0, #0x62]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
