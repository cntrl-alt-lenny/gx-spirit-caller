        .text
        .extern data_02102958
        .global func_020a724c
        .arm
func_020a724c:
    stmdb sp!, {r3, lr}
    ldr r2, .L_020a7264
    ldr r2, [r2, #0x8]
    ldr r2, [r2, #0x4]
    blx r2
    ldmia sp!, {r3, pc}
.L_020a7264: .word data_02102958
