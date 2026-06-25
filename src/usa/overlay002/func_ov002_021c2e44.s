; func_ov002_021c2e44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .global func_ov002_021c2e44
        .arm
func_ov002_021c2e44:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r3, r0, r2
    ldr r2, _LIT1
    mov r0, #0x0
    ldr r2, [r2, r3]
    mov ip, r0
    cmp r2, #0x0
    ldmlsia sp!, {r3, pc}
    ldr r2, _LIT2
    add r3, r2, r3
    add r2, r3, #0x18
    add lr, r2, #0x400
    ldr r2, [r3, #0x14]
.L_111c:
    ldr r3, [lr]
    add ip, ip, #0x1
    mov r3, r3, lsl #0x13
    cmp r1, r3, lsr #0x13
    addeq r0, r0, #0x1
    cmp ip, r2
    add lr, lr, #0x4
    bcc .L_111c
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
