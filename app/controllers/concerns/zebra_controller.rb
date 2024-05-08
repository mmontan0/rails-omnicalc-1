class ZebraController < ApplicationController
  def square_new
    render({:template => "calculators/square_calc"})
  end

  def square_results
    @num_square=params.fetch("users_number").to_f
    @the_result=@num_square**2
    render({:template => "calculators/square_results"})
  end

  def square_root_new
      render({:template => "calculators/square_root_calc"})
  end

  def square_root_result
    @the_num_root=params.fetch("users_number_root").to_f
    @the_result_root=@the_num_root**0.5
    render({:template => "calculators/square_root_results"})
  end

  def payment_new
    render({:template => "calculators/payment_calc"})
  end

  def payment_result
    @apr_=params.fetch("users_apr").to_f
    @apr_percentage=@apr_/100
    @r_=@apr_percentage/12
    @years_=params.fetch("users_years").to_i
    @periods=@years_*12
    @present_value=params.fetch("users_pv").to_f
    @numerator=(@r_*@present_value)
    @denominator=(1-(1+@r_)**-@periods)
    @result_payment=@numerator/@denominator
    render({:template => "calculators/payment_results"})

  end
end
