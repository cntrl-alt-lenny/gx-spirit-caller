; func_ov002_0221dd08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021df818
        .global func_ov002_0221dd08
        .arm
func_ov002_0221dd08:
    stmdb sp!, {r4, lr}
    ldrh r1, [r0, #0x4]
    mov r2, r1, lsl #0x1d
    movs r2, r2, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r0, #0x2]
    mov ip, r1, lsl #0x11
    ldr r4, _LIT0
    mov r1, r2, lsl #0x1f
    mov r3, r2, lsl #0x1a
    mov r1, r1, lsr #0x1f
    ldr r2, _LIT1
    and lr, r1, #0x1
    mla r4, lr, r2, r4
    mov r3, r3, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    add r3, r4, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsr #0x17
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r0, #0x8]
    cmp r2, #0x0
    beq .L_b0c
    rsb r1, r1, #0x1
    mov r2, #0x1f4
    bl func_ov002_021df818
.L_b0c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
