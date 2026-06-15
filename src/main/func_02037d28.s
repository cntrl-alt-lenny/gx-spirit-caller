; func_02037d28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037ca0
        .extern func_020386f4
        .extern func_0203c620
        .extern func_02087558
        .extern func_02087e54
        .global func_02037d28
        .arm
func_02037d28:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    strb r1, [r6, #0x26]
    ldr r1, [r6, #0x34]
    mov r5, r2
    mov r1, r1, lsr #0x14
    and r2, r1, #0xf
    cmp r2, #0x5
    bne .L_dc
    bl func_02037ca0
    mov r4, r0
    mov r1, r4
    mov r2, r5
    add r0, r6, #0x40
    bl func_020386f4
    cmp r5, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x4]
    mov r1, r4
    bl func_02087558
    ldmia sp!, {r4, r5, r6, pc}
.L_dc:
    ldrh r1, [r6, #0x68]
    tst r1, #0x6000
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r2, #0x4
    bne .L_108
    bl func_02037ca0
    mov r1, r0
    ldr r0, [r6, #0x4]
    mov r2, r5
    bl func_0203c620
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    bl func_02037ca0
    mov r1, r0
    mov r2, r5
    add r0, r6, #0x4
    bl func_02087e54
    ldmia sp!, {r4, r5, r6, pc}
