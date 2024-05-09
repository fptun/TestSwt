import { useRef } from 'react';
import cat from './cat.gif';
import land from './land.png'
import moon from './moon.png'

import { Parallax, ParallaxLayer } from '@react-spring/parallax';

function App() {
  const ref = useRef()
  return (
    <div className="App">
      {/* offset: index of page (min 0) 
          speed: speed when scrolling in layer

          factor: is size of layer/page (ex: pages = 4, factor = 2=> this layer has size half of page)
      */}
      <Parallax pages={4} ref={ref}>
        {/* layer cat */}
        <ParallaxLayer
          sticky={{
            //start fix in page 0.9 (in page 1) to page 2.5 (in page 2)
            start: 0.9,
            end: 2.5
          }}
        >
          <img src={cat}></img>
        </ParallaxLayer>

        {/* background moon */}
        <ParallaxLayer
          offset={0}
          speed={1}
          factor={2}
          style={{
            backgroundImage: `url(${moon})`,
            backgroundSize: 'cover'
          }}
        >
        </ParallaxLayer>

        {/* background land */}
        <ParallaxLayer
          offset={2}
          speed={1}
          factor={4}
          style={{
            backgroundImage: `url(${land})`,
            backgroundSize: 'cover'
          }}>
        </ParallaxLayer>

        {/* first title */}
        <ParallaxLayer
          offset={0.2}
          speed={0.05}
          onClick={() => ref.current.scrollTo(3)}
        >
          <h2>Welcome my website</h2>
        </ParallaxLayer>

        {/* second title */}
        <ParallaxLayer
          offset={3.2}
          speed={2}
          onClick={() => ref.current.scrollTo(0)}
        >
          <h2>Web developer is fun</h2>
        </ParallaxLayer>

      </Parallax>
    </div>
  );
}

export default App;
