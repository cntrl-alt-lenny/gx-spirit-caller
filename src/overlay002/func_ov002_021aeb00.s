; func_ov002_021aeb00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021aeb00
        .arm
func_ov002_021aeb00:
    stmdb sp!, {r3, lr}
    ldr ip, [r2]
    mov lr, #0x0
    ldrsb r3, [ip]
    cmp r3, #0x0
    beq .L_48
    sub r3, r1, #0x1
.L_1c:
    ldrsb r1, [ip], #0x1
    strb r1, [r0, lr]
    add lr, lr, #0x1
    cmp lr, r3
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
    ldrsb r1, [ip, #-1]
    cmp r1, #0xa
    ldrnesb r1, [ip]
    cmpne r1, #0x0
    bne .L_1c
.L_48:
    mov r1, #0x0
    strb r1, [r0, lr]
    mov r0, lr
    str ip, [r2]
    ldmia sp!, {r3, pc}
