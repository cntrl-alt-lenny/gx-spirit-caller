; func_ov000_021abe64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3a7c
        .global func_ov000_021abe64
        .arm
func_ov000_021abe64:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr ip, [r5, #0x4]
    ldr r0, [r5, #0x8]
    mov r1, ip, lsl #0x10
    mov r4, r1, lsr #0x18
    mov r2, ip, lsl #0x18
    mov r1, r4, lsl #0x1
    mov r3, r0, lsl #0x10
    rsb r2, r1, r2, lsr #0x18
    mov r1, ip, lsl #0x8
    ldr ip, [r5, #0xc]
    mov r3, r3, lsr #0x10
    sub r1, r2, r1, lsr #0x18
    mov r2, ip, lsl #0x18
    mov ip, r2, lsr #0x18
    mul r2, r3, r1
    rsb r1, ip, r0, lsr #0x10
    add r0, r2, r1, lsr #0x1
    bl func_020b3a7c
    ldr r1, [r5]
    mov r1, r1, lsl #0x8
    add r1, r4, r1, lsr #0x17
    add r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
