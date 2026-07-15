; func_ov005_021abd24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021abd24
        .arm
func_ov005_021abd24:
    stmdb sp!, {r4, lr}
    ldr ip, [r0, #0x60]
    ldr r4, [ip, #0x4]
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    add lr, r1, r3
    sub r1, r1, #0x10
    mvn r0, #0x0
.L_20:
    cmp r4, r2
    beq .L_44
    ldrsh r3, [ip, #0x8]
    cmp r3, #0x0
    blt .L_44
    cmp r3, r1
    ble .L_44
    cmp r3, lr
    strlth r0, [ip, #0x8]
.L_44:
    add ip, ip, #0x10
    ldr r4, [ip, #0x4]
    cmp r4, #0x0
    bne .L_20
    ldmia sp!, {r4, pc}
