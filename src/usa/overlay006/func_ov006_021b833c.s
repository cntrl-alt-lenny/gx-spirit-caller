; func_ov006_021b833c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .global func_ov006_021b833c
        .arm
func_ov006_021b833c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    cmp r5, #0x4
    addls pc, pc, r5, lsl #0x2
    b .L_4c0
    b .L_410
    b .L_434
    b .L_458
    b .L_47c
    b .L_4a0
.L_410:
    cmp r4, #0x0
    addne r0, r6, #0x1d8
    addne r1, r0, #0x8000
    addeq r0, r6, #0x2a0
    addeq r1, r0, #0x6000
    mov r0, #0x0
    mov r2, #0x17c0
    bl Fill32
    b .L_4c0
.L_434:
    cmp r4, #0x0
    addne r0, r6, #0x158
    addne r1, r0, #0xb000
    addeq r0, r6, #0xa60
    addeq r1, r0, #0x7000
    mov r0, #0x0
    mov r2, #0x200
    bl Fill32
    b .L_4c0
.L_458:
    cmp r4, #0x0
    addne r0, r6, #0x358
    addne r1, r0, #0xb400
    addeq r0, r6, #0xc60
    addeq r1, r0, #0x7000
    mov r0, #0x0
    mov r2, #0x200
    bl Fill32
    b .L_4c0
.L_47c:
    cmp r4, #0x0
    addne r0, r6, #0x158
    addne r1, r0, #0xbc00
    addeq r0, r6, #0xe60
    addeq r1, r0, #0x7000
    mov r0, #0x0
    mov r2, #0x200
    bl Fill32
    b .L_4c0
.L_4a0:
    cmp r4, #0x0
    addne r0, r6, #0x358
    addne r1, r0, #0xc000
    addeq r0, r6, #0x60
    addeq r1, r0, #0x8000
    mov r0, #0x0
    mov r2, #0x100
    bl Fill32
.L_4c0:
    add r0, r6, r5, lsl #0x1
    cmp r4, #0x0
    mov r1, #0x0
    addne r0, r0, #0xc600
    strneh r1, [r0, #0x58]
    addeq r0, r0, #0x8100
    streqh r1, [r0, #0x60]
    streqh r1, [r0, #0x6a]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
