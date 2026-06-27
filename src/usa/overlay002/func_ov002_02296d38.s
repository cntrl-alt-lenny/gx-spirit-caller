; func_ov002_02296d38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bbdcc
        .global func_ov002_02296d38
        .arm
func_ov002_02296d38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x0
    bl func_ov002_021bbdcc
    mov r4, r0
    mov r0, #0x1
    bl func_ov002_021bbdcc
    ldr r1, _LIT0
    ldrh r2, [r5, #0x2]
    add ip, r4, r0
    ldr lr, [r1, #0xc]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r2, r0, #0x1
    ldr r0, _LIT1
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r2, [r1, #0x874]
    add r0, lr, ip
    add r2, r2, r0
    mov r0, #0x12c
    mul r0, r2, r0
    ldr r1, [r1, r3]
    cmp r1, r0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
