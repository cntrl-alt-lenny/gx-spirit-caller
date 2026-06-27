; func_ov002_02288240 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_0220ea10
        .global func_ov002_02288240
        .arm
func_ov002_02288240:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    add r1, sp, #0x0
    mov r4, r0
    bl func_ov002_0220ea10
    ldrh r2, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, #0x3e8
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    ldr r3, [r1, r2, lsl #0x2]
    rsb r0, r0, #0x0
    cmp r3, r0
    addle sp, sp, #0x8
    movle r0, #0x1
    ldmleia sp!, {r4, pc}
    and r1, r2, #0x1
    add r0, r0, #0xc50
    mul r2, r1, r0
    ldr r0, _LIT0
    ldr r0, [r0, r2]
    add r0, r0, r3
    cmp r0, #0x0
    movle r0, #0x1
    movgt r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
