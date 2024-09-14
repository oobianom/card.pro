library(shiny)
library(card.pro)

# Define UI for application that draws a histogram
ui <- fluidPage(
  HTML('<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
       '),
    use.cardpro(jqueryui = F, fontawesome = F),
    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        icon("font"),
                        min = 1,
                        max = 50,
                        value = 30)


        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           HTML("
                 <section id='widget-grid' class=''>

					<!-- row -->
					<div class='row'>
						<article class='col-sm-12'>
							<!-- new widget -->
							<div class='jarviswidget' id='wid-id-0' data-widget-togglebutton='false' data-widget-editbutton='false' data-widget-fullscreenbutton='false' data-widget-colorbutton='false' data-widget-deletebutton='false'>
								<!-- widget options:
								usage: <div class='jarviswidget' id='wid-id-0' data-widget-editbutton='false'>

								data-widget-colorbutton='false'
								data-widget-editbutton='false'
								data-widget-togglebutton='false'
								data-widget-deletebutton='false'
								data-widget-fullscreenbutton='false'
								data-widget-custombutton='false'
								data-widget-collapsed='true'
								data-widget-sortable='false'

								-->
								<header>
									<span class='widget-icon'> <i class='glyphicon glyphicon-stats txt-color-darken'></i> </span>
									<h2>Live Feeds </h2>

									<ul class='nav nav-tabs pull-right in' id='myTab'>
										<li class='active'>
											<a data-toggle='tab' href='#s1'><i class='fa fa-clock-o'></i> <span class='hidden-mobile hidden-tablet'>Live Stats</span></a>
										</li>

										<li>
											<a data-toggle='tab' href='#s2'><i class='fa fa-facebook'></i> <span class='hidden-mobile hidden-tablet'>Social Network</span></a>
										</li>

										<li>
											<a data-toggle='tab' href='#s3'><i class='fa fa-dollar'></i> <span class='hidden-mobile hidden-tablet'>Revenue</span></a>
										</li>
									</ul>

								</header>

								<!-- widget div-->
								<div class='no-padding'>
									<!-- widget edit box -->
									<div class='jarviswidget-editbox'>

										<div>
											<label>Title0:</label>
											<input type='text' />
										</div>
									</div>
									<!-- end widget edit box -->

									<div class='widget-body'>
										<!-- content -->
										<div id='myTabContent' class='tab-content'>
											<div class='tab-pane fade active in padding-10 no-padding-bottom' id='s1'>
												Tab 1
											</div>
											<!-- end s1 tab pane -->

											<div class='tab-pane fade' id='s2'>
												<div class='widget-body-toolbar bg-color-white'>

													top

												</div>
												<div class='padding-10'>
													Bottom
												</div>

											</div>
											<!-- end s2 tab pane -->

											<div class='tab-pane fade' id='s3'>

												<div class='widget-body-toolbar bg-color-white smart-form' id='rev-toggles'>

													<div class='inline-group'>

														<label for='gra-0' class='checkbox'>
															<input type='checkbox' name='gra-0' id='gra-0' checked='checked'>
															<i></i> Target </label>
														<label for='gra-1' class='checkbox'>
															<input type='checkbox' name='gra-1' id='gra-1' checked='checked'>
															<i></i> Actual </label>
														<label for='gra-2' class='checkbox'>
															<input type='checkbox' name='gra-2' id='gra-2' checked='checked'>
															<i></i> Signups </label>
													</div>

													<div class='btn-group hidden-phone pull-right'>
														Just here
													</div>

												</div>

												<div class='padding-10'>
													<div id='flotcontainer' class='chart-large has-legend-unique'></div>
												</div>
											</div>
											<!-- end s3 tab pane -->
										</div>

										<!-- end content -->
									</div>

								</div>
								<!-- end widget div -->
							</div>
							<!-- end widget -->

						</article>
					</div>

					<!-- end row -->

					<!-- row -->

					<div class='row'>

						<article class='col-sm-12 col-md-12 col-lg-6'>

							<!-- new widget -->
							<div class='jarviswidget jarviswidget-color-blueDark' id='wid-id-1' data-widget-editbutton='true' data-widget-fullscreenbutton='true'>

								<!-- widget options:
								usage: <div class='jarviswidget' id='wid-id-0' data-widget-editbutton='false'>

								data-widget-colorbutton='false'
								data-widget-editbutton='false'
								data-widget-togglebutton='false'
								data-widget-deletebutton='false'
								data-widget-fullscreenbutton='false'
								data-widget-custombutton='false'
								data-widget-collapsed='true'
								data-widget-sortable='false'

								-->

								<header>
									<span class='widget-icon'> <i class='fa fa-comments txt-color-white'></i> </span>
									<h2> SmartChat </h2>
									<div class='widget-toolbar'>
										<!-- add: non-hidden - to disable auto hide -->

										<div class='btn-group'>
											<button class='btn dropdown-toggle btn-xs btn-success' data-toggle='dropdown'>
												Status <i class='fa fa-caret-down'></i>
											</button>
											<ul class='dropdown-menu pull-right js-status-update'>
												<li>
													<a href='javascript:void(0);'><i class='fa fa-circle txt-color-green'></i> Online</a>
												</li>
												<li>
													<a href='javascript:void(0);'><i class='fa fa-circle txt-color-red'></i> Busy</a>
												</li>
												<li>
													<a href='javascript:void(0);'><i class='fa fa-circle txt-color-orange'></i> Away</a>
												</li>
												<li class='divider'></li>
												<li>
													<a href='javascript:void(0);'><i class='fa fa-power-off'></i> Log Off</a>
												</li>
											</ul>
										</div>
									</div>
								</header>

								<!-- widget div-->
								<div>
									<!-- widget edit box -->
									<div class='jarviswidget-editbox'>
										<div>
											<label>Title:</label>
											<input type='text' />
										</div>
									</div>
									<!-- end widget edit box -->

									<div class='widget-body widget-hide-overflow no-padding'>
										<!-- content goes here -->

										<!-- CHAT CONTAINER -->
										<div id='chat-container'>
											<span class='chat-list-open-close'><i class='fa fa-cog'></i></span>

											<div class='chat-list-body custom-scroll'>
												<ul id='chat-users'>
													<li>
														<a href='javascript:void(0);'><span class='badge badge-inverse'>23</span> Graph settings <span class='state'><i class='fa fa-circle txt-color-green pull-right'></i></span></a>
													</li>
													<li>
														<a href='javascript:void(0);'>Boom</a>
													</li>
													<li>
														<a href='javascript:void(0);'><img src='img/avatars/male.png' alt=''>Belmain Dolson <span class='state'><i class='last-online pull-right'>45m</i></span></a>
													</li>
													<li>
														<a href='javascript:void(0);'><img src='img/avatars/male.png' alt=''>Galvitch Drewbery <span class='state'><i class='fa fa-circle txt-color-green pull-right'></i></span></a>
													</li>
													<li>
														<a href='javascript:void(0);'><img src='img/avatars/male.png' alt=''>Sadi Orlaf <span class='state'><i class='fa fa-circle txt-color-green pull-right'></i></span></a>
													</li>
													<li>
														<a href='javascript:void(0);'><img src='img/avatars/male.png' alt=''>Markus <span class='state'><i class='last-online pull-right'>2m</i></span> </a>
													</li>
													<li>
														<a href='javascript:void(0);'><img src='img/avatars/sunny.png' alt=''>Sunny <span class='state'><i class='last-online pull-right'>2m</i></span> </a>
													</li>
													<li>
														<a href='javascript:void(0);'><img src='img/avatars/male.png' alt=''>Denmark <span class='state'><i class='last-online pull-right'>2m</i></span> </a>
													</li>
												</ul>
											</div>
											<div class='chat-list-footer'>

												<div class='control-group'>

													<form class='smart-form'>

														<section>
															<label class='input'>
																<input type='text' id='filter-chat-list' placeholder='Filter'>
															</label>
														</section>

													</form>

												</div>

											</div>

										</div>

										<!-- CHAT BODY -->
										<div id='chat-body' class='chat-body custom-scroll'>
											hi

										</div>

										<!-- CHAT FOOTER -->
										<div class='chat-footer'>
Footer badge
											</div>

										<!-- end content -->
									</div>

								</div>
								<!-- end widget div -->
							</div>
							<!-- end widget -->

							<!-- new widget -->
							<div class='jarviswidget jarviswidget-color-blueDark' id='wid-id-3' data-widget-colorbutton='false'>

								<!-- widget options:
								usage: <div class='jarviswidget' id='wid-id-0' data-widget-editbutton='false'>

								data-widget-colorbutton='false'
								data-widget-editbutton='false'
								data-widget-togglebutton='false'
								data-widget-deletebutton='false'
								data-widget-fullscreenbutton='false'
								data-widget-custombutton='false'
								data-widget-collapsed='true'
								data-widget-sortable='false'

								-->
								<header>
									<span class='widget-icon'> <i class='fa fa-calendar'></i> </span>
									<h2> My Events </h2>
									<div class='widget-toolbar'>
										<!-- add: non-hidden - to disable auto hide -->
										<div class='btn-group'>
											<button class='btn dropdown-toggle btn-xs btn-default' data-toggle='dropdown'>
												Showing <i class='fa fa-caret-down'></i>
											</button>
											<ul class='dropdown-menu js-status-update pull-right'>
												<li>
													<a href='javascript:void(0);' id='mt'>Month</a>
												</li>
												<li>
													<a href='javascript:void(0);' id='ag'>Agenda</a>
												</li>
												<li>
													<a href='javascript:void(0);' id='td'>Today</a>
												</li>
											</ul>
										</div>
									</div>
								</header>

								<!-- widget div-->
								<div>
									<!-- widget edit box -->
									<div class='jarviswidget-editbox'>

										<input class='form-control' type='text'>

									</div>
									<!-- end widget edit box -->

									<div class='widget-body no-padding'>
										<!-- content goes here -->
										<div class='widget-body-toolbar'>

											<div id='calendar-buttons'>

												<div class='btn-group'>
													<a href='javascript:void(0)' class='btn btn-default btn-xs' id='btn-prev'><i class='fa fa-chevron-left'></i></a>
													<a href='javascript:void(0)' class='btn btn-default btn-xs' id='btn-next'><i class='fa fa-chevron-right'></i></a>
												</div>
											</div>
										</div>
										<div id='calendar'></div>

										<!-- end content -->
									</div>

								</div>
								<!-- end widget div -->
							</div>
							<!-- end widget -->

						</article>

						<article class='col-sm-12 col-md-12 col-lg-6'>

							<!-- new widget -->
							<div class='jarviswidget jarviswidget-color-pinkDark' id='wid-id-2'  >

								<!-- widget options:
								usage: <div class='jarviswidget' id='wid-id-0' data-widget-editbutton='false'>

								data-widget-colorbutton='false'
								data-widget-editbutton='false'
								data-widget-togglebutton='false'
								data-widget-deletebutton='false'
								data-widget-fullscreenbutton='false'
								data-widget-custombutton='false'
								data-widget-collapsed='true'
								data-widget-sortable='false'

								-->

								<header>
									<span class='widget-icon'> <i class='fa fa-map-marker'></i> </span>
									<h2>Birds Eye</h2>
									<div class='widget-toolbar hidden-mobile'>
										<span class='onoffswitch-title'><i class='fa fa-location-arrow'></i> Realtime</span>
										<span class='onoffswitch'>
											<input type='checkbox' name='onoffswitch' class='onoffswitch-checkbox' checked='checked' id='myonoffswitch'>
											<label class='onoffswitch-label' for='myonoffswitch'> <span class='onoffswitch-inner' data-swchon-text='YES' data-swchoff-text='NO'></span> <span class='onoffswitch-switch'></span> </label> </span>
									</div>
								</header>

								<!-- widget div-->
								<div>
									<!-- widget edit box -->
									<div class='jarviswidget-editbox'>
										<div>
											<label>Title:</label>
											<input type='text' />
										</div>
									</div>
									<!-- end widget edit box -->

									<div class='widget-body'> Here now </div>


									</div>

								</div>
								<!-- end widget div -->

							<!-- end widget -->

							<!-- new widget -->
							<div class='jarviswidget jarviswidget-color-blue' id='wid-id-4'>

								<!-- widget options:
								usage: <div class='jarviswidget' id='wid-id-0' data-widget-editbutton='false'>

								data-widget-colorbutton='false'
								data-widget-editbutton='false'
								data-widget-togglebutton='false'
								data-widget-deletebutton='false'
								data-widget-fullscreenbutton='false'
								data-widget-custombutton='false'
								data-widget-collapsed='true'
								data-widget-sortable='false'

								-->

								<header>
									<span class='widget-icon'> <i class='fa fa-check txt-color-white'></i> </span>
									<h2> ToDo's </h2>
									<!-- <div class='widget-toolbar'>
									add: non-hidden - to disable auto hide

									</div>-->
								</header>

								<!-- widget div-->
								<div>
									<!-- widget edit box -->
									<div class='jarviswidget-editbox'>
										<div>
											<label>Titles:</label>
											<input type='text' />
										</div>
									</div>
									<!-- end widget edit box -->

									<div class='widget-body nod-padding smart-form'>Hello </div>

								</div>
								<!-- end widget div -->
							</div>
							<!-- end widget -->

						</article>

					</div>

					<!-- end row -->

				</section>
				")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application
shinyApp(ui = ui, server = server)
