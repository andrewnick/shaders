#version 300 es

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st,float pct){
    return smoothstep(pct-.02,pct,st.y)-
    smoothstep(pct,pct+.02,st.y);
}

// Plot a vertical line
float ploty(vec2 st,vec2 start,vec2 end){
    
    float lineWidth=.001;
    if(start.y<=st.y&&end.y>=st.y&&start.x-lineWidth<=st.x&&start.x+lineWidth>=st.x){
        return 1.;
    }
    
    return 0.;
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    vec2 start=vec2(.2,.2);
    vec2 end=vec2(.2,.5);
    
    float y=st.x;
    
    vec3 color=vec3(y);
    float lineLength=end.y-start.y;
    // Plot a line
    // float pct = plot(st,y);
    float pct=ploty(st,start,end);
    color=pct*vec3(lineLength,.1,.5);
    
    gl_FragColor=vec4(color,1.);
}