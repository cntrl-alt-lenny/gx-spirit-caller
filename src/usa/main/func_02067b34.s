; func_02067b34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02067b94
        .extern func_02067be4
        .extern func_02067c74
        .global func_02067b34
        .arm
func_02067b34:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    bl func_02067c74
    mov r0, r4
    bl func_02067be4
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    ble .L_38
    mov r0, r4
    bl func_02067b94
.L_38:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r3, [r4, #0x48]
    ldr ip, [r4, #0x44]
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x0
    blx ip
    ldmia sp!, {r4, pc}
