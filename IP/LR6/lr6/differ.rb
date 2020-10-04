POINT_0 = 0.49
POINT_1 = 0.50
POINT_2 = 0.51
STEP = (POINT_1 - POINT_0).abs



class Differ
  # with block
  def differ_with_block
    dif_point_0 = (-3 * yield(POINT_0) + 4 * yield(POINT_1) - yield(POINT_2)) / (2 * STEP).to_f
    dif_point_1 = (-yield(POINT_0) + yield(POINT_2)) / (2 * STEP).to_f
    dif_point_2 = (yield(POINT_0) - 4 * yield(POINT_1) + 3 * yield(POINT_2)) / (2 * STEP).to_f
    p [dif_point_0.round(2), dif_point_1.round(2), dif_point_2.round(2)]
  end

  # with lambda
  def differ_with_lambda(math_func)
    dif_point_0 = (-3 * math_func.call(POINT_0) + 4 * math_func.call(POINT_1) - math_func.call(POINT_2)) / (2 * STEP).to_f
    dif_point_1 = (-math_func.call(POINT_0) + math_func.call(POINT_2)) / (2 * STEP).to_f
    dif_point_2 = (math_func.call(POINT_0) - 4 * math_func.call(POINT_1) + 3 * math_func.call(POINT_2)) / (2 * STEP).to_f
    p [dif_point_0.round(2), dif_point_1.round(2), dif_point_2.round(2)]
  end
end

# dif.differ_with_lambda(->(x) { Math.sin(x) })
