require 'singleton'
class ComputerBuilder
  include Singleton
  def build options={}
    @computer = Computer.new options
  end

  def add_memory megabytes
    @computer.memory = megabytes
  end

  def add_video card_name
    @computer.video = card_name
  end

  def add_cd
    @computer.cd = true
  end

  def add_cpu cpu_name
    @computer.cpu = cpu_name
  end

  def computer
    @computer
  end
end

class Computer  
  attr_accessor :memory, :cpu, :video, :cd

  def initialize options={}
    options[:memory] ||= 0
    options[:cpu] ||= ""
    options[:video] ||= "" 
    options[:cd] ||= false 
    @memory = options[:memory]
    @cpu = options[:cpu]
    @video = options[:video]
    @cd = options[:cd]
  end

  def to_s
    puts "INFO".center(30,'-')
    puts %Q{ Cpu: #{cpu} }
    puts %Q{ Memory: #{memory} }
    puts %Q{ Video: #{video} }
    puts %Q{ CD-ROM: #{cd} }
  end
end
#
builder = ComputerBuilder.instance
builder.build(memory: 256, cpu: 'Xeon', cd:true, video: "GeForce 760")
computer_xeon = builder.computer
computer_xeon.to_s

builder.build
builder.add_cpu 'Pentium'
builder.add_cd
builder.add_memory 256
computer_pentium = builder.computer
computer_pentium.to_s
computer_xeon.to_s
