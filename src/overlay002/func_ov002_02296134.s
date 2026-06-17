; func_ov002_02296134 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_02296134
        .arm
func_ov002_02296134:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    ldr r3, _LIT0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov lr, r1, lsr #0x1f
    and r1, lr, #0x1
    mla ip, r1, r0, r3
    ldr r2, [ip, #0xf8]
    ldr r1, _LIT2
    mov r2, r2, lsl #0x13
    mov r2, r2, lsr #0x13
    cmp r2, r1
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    rsb r1, lr, #0x1
    and r1, r1, #0x1
    mul r0, r1, r0
    ldr r1, [ip]
    ldr r0, [r3, r0]
    cmp r1, r0, lsl #0x1
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x0000175e
