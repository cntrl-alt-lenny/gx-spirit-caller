; func_ov002_02232b94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021de390
        .extern func_ov002_0221065c
        .global func_ov002_02232b94
        .arm
func_ov002_02232b94:
    stmdb sp!, {r4, lr}
    ldrh r2, [r0, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x5
    bne .L_d0c
    mov r1, r2, lsl #0x1f
    mov r3, r1, lsr #0x1f
    mov r4, r2, lsl #0x1a
    ldr ip, _LIT0
    ldr r1, _LIT1
    and r2, r3, #0x1
    mla lr, r2, r1, ip
    ldrh r2, [r0, #0x4]
    mov r1, r4, lsr #0x1b
    mov r0, #0x14
    mov ip, r2, lsl #0x11
    mul r0, r1, r0
    add r2, lr, #0x30
    ldr r2, [r2, r0]
    mov ip, ip, lsr #0x17
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    cmp ip, r0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r2, #0x0
    mov r0, r3
    mov r3, r2
    bl func_ov002_021de390
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_d0c:
    bl func_ov002_0221065c
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
