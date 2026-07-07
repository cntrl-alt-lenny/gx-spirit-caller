; func_ov002_02204eb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf0c2
        .extern data_ov002_022d008c
        .extern func_ov002_021b3dec
        .global func_ov002_02204eb8
        .arm
func_ov002_02204eb8:
    stmdb sp!, {r3, lr}
    mov r2, r0
    ldrh ip, [r2, #0x2]
    mov r0, ip, lsl #0x14
    mov r0, r0, lsr #0x1a
    add r0, r0, #0xee
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_c0
    ldr r0, _LIT0
    mov r3, ip, lsl #0x1f
    ldr r1, [r0, #0xcec]
    mov r0, r3, lsr #0x1f
    cmp r1, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT1
    mov ip, ip, lsl #0x1a
    ldr r3, [r1, #0x1c]
    mov r1, ip, lsr #0x1b
    cmp r3, ip, lsr #0x1b
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldrh r2, [r2]
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT1
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr ip, [r0, #0x4]
    ldr r2, [r0, #0x20]
    mov r1, #0x14
    ldr r0, _LIT2
    ldr r3, _LIT3
    and ip, ip, #0x1
    mul r1, r2, r1
    mla r0, ip, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd314
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf0c2
