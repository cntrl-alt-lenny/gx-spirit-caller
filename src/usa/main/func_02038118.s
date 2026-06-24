; func_02038118 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037b08
        .extern func_02087c44
        .global func_02038118
        .arm
func_02038118:
    stmdb sp!, {r4, lr}
    mov r4, r1
    bl func_02037b08
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x34]
    mov r1, r1, lsr #0x14
    and r1, r1, #0xf
    cmp r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    strh r4, [r0, #0x1a]
    ldrh r1, [r0, #0x68]
    tst r1, #0x6000
    bne .L_514
    mov r1, r4
    add r0, r0, #0x4
    bl func_02087c44
.L_514:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
